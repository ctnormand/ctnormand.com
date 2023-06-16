"""Unit tests for aws_lambda.cloudfront_cache_invalidator"""
import json

import pytest

from aws_lambda.cloudfront_cache_invalidator.main import handler

pytestmark = pytest.mark.parametrize(
    "key, expected_paths",
    [
        ("foo/bar.txt", ["/foo/bar.txt"]),
        ("foo/index.html", ["/foo/index.html", "/foo", "/foo/"]),
        ("index.html", ["/index.html", "/"]),
    ],
)


@pytest.fixture
def s3_put_event():
    with open("tests/sample_events/s3_put.json") as f:
        event = json.load(f)
    return event


@pytest.fixture
def s3_delete_event():
    with open("tests/sample_events/s3_delete.json") as f:
        event = json.load(f)
    return event


def test_handler_s3_put(mocker, s3_put_event, key, expected_paths):
    """Test lambda handler when S3 object is created."""
    mocker.patch(
        "aws_lambda.cloudfront_cache_invalidator.main.CLOUDFRONT_DISTRIBUTION_ID",
        "ABC123",
    )
    mock_client = mocker.patch(
        "aws_lambda.cloudfront_cache_invalidator.main.cloudfront_client"
    )
    s3_put_event["detail"]["object"]["key"] = key

    handler(s3_put_event)

    kwargs = mock_client.create_invalidation.call_args.kwargs
    assert kwargs["DistributionId"] == "ABC123"
    assert kwargs["InvalidationBatch"]["Paths"]["Quantity"] == len(expected_paths)
    assert len(kwargs["InvalidationBatch"]["Paths"]["Items"]) == len(expected_paths)
    for path in expected_paths:
        assert path in kwargs["InvalidationBatch"]["Paths"]["Items"]


def test_handler_s3_delete(mocker, s3_delete_event, key, expected_paths):
    """Test lambda handler when S3 onject is deleted."""
    mocker.patch(
        "aws_lambda.cloudfront_cache_invalidator.main.CLOUDFRONT_DISTRIBUTION_ID",
        "ABC123",
    )
    mock_client = mocker.patch(
        "aws_lambda.cloudfront_cache_invalidator.main.cloudfront_client"
    )
    s3_delete_event["detail"]["object"]["key"] = key

    handler(s3_delete_event)

    kwargs = mock_client.create_invalidation.call_args.kwargs
    assert kwargs["DistributionId"] == "ABC123"
    assert kwargs["InvalidationBatch"]["Paths"]["Quantity"] == len(expected_paths)
    assert len(kwargs["InvalidationBatch"]["Paths"]["Items"]) == len(expected_paths)
    for path in expected_paths:
        assert path in kwargs["InvalidationBatch"]["Paths"]["Items"]
