"""AWS Lambda function to automatically create cloudfront invalidations when S3
objects are created or deleted.
"""
import logging
import os
import time

import boto3

CLOUDFRONT_DISTRIBUTION_ID = os.environ.get("CLOUDFRONT_DISTRIBUTION_ID")

log = logging.getLogger()
log.setLevel(logging.INFO)
cloudfront_client = boto3.client("cloudfront")


def handler(event, context=None):
    """Creates an invalidation when an S3 object is created or deleted."""
    bucket = event["detail"]["bucket"]["name"]
    key = event["detail"]["object"]["key"]
    paths = [f"/{key}"]

    # Must invalidate additional paths if modified file is index.html
    if os.path.basename(key) == "index.html":
        paths.append(f"/{os.path.dirname(key)}")
        if os.path.dirname(key) != "":
            paths.append(f"/{os.path.dirname(key)}/")
    try:
        res = cloudfront_client.create_invalidation(
            DistributionId=CLOUDFRONT_DISTRIBUTION_ID,
            InvalidationBatch={
                "Paths": {"Quantity": len(paths), "Items": paths},
                "CallerReference": str(int(time.time() * 1000)),
            },
        )
    except Exception as e:  # noqa: F841
        log.exception(
            f"Failed to create invalidation for {bucket}{key} on CloudFront "
            f"distribution {CLOUDFRONT_DISTRIBUTION_ID}."
        )
    else:
        log.info(
            f"Created invalidation for {bucket}{key} on Cloudfront "
            f"distribution {CLOUDFRONT_DISTRIBUTION_ID}. "
            f"(Invalidation ID: {res['Invalidation']['Id']})."
        )
