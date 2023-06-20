# Christian Normand's Portfolio

[![Build Workflow Badge](https://github.com/ctnormand1/ctnormand.com/actions/workflows/build.yaml/badge.svg?event=push)](https://github.com/ctnormand1/ctnormand.com/actions/workflows/build.yaml)
[![S3 Workflow Badge](https://github.com/ctnormand1/ctnormand.com/actions/workflows/s3.yaml/badge.svg)](https://github.com/ctnormand1/ctnormand.com/actions/workflows/s3.yaml)
[![Coverage Status](https://coveralls.io/repos/github/ctnormand1/ctnormand.com/badge.svg?branch=main)](https://coveralls.io/github/ctnormand1/ctnormand.com?branch=main)

:computer: Visit my portfolio at [ctnormand.com](https://www.ctnormand.com).

## About

My portfolio is a simple, one-page static site with infrastructure managed by Terraform, and deployment fully automated by GitHub Actions. Infrastructure as Code and CI/CD are powerful tools that are considered best practices on data and software engineering teams. Although I've been using both technologies for a while, I wanted to get some experience setting up a project from scratch.

I'm excited to have these skills in my toolbelt, and I look forward to applying them to bigger projects.

## Repository Structure

- [aws_lambda](https://github.com/ctnormand1/ctnormand.com/tree/main/aws_lambda)
  - [cloudfront_cache_invalidator](https://github.com/ctnormand1/ctnormand.com/tree/main/aws_lambda/cloudfront_cache_invalidator): Lambda function to automatically invalidate files from CloudFront edge caches when website content is changed.
- [ctnormand.com](https://github.com/ctnormand1/ctnormand.com/tree/main/ctnormand.com): Static website content.
- [terraform](https://github.com/ctnormand1/ctnormand.com/tree/main/terraform): Everything for deploying infrastructure to AWS.
- [tests](https://github.com/ctnormand1/ctnormand.com/tree/main/tests): Unit tests for lambda function.
  
## Acknowledgments

- My portfolio uses a slightly modified version of the Miniport template from [HTML5 UP](https://html5up.net/).
- [This blog post](https://www.alexhyett.com/terraform-s3-static-website-hosting/) by Alex Hyett was really helpful with some of the Terraform setup, CloudFront configuration, and snazzy redirects to the www subdomain.
- [This blog post](https://gaunacode.com/deploying-terraform-at-scale-with-github-actions) by Facundo Gauna helped a bunch with the GitHub Actions workflow for Terraform.
- I'd be remiss if I didn't shout out [TechWorld with Nana](https://www.techworld-with-nana.com/) for providing a solid foundation on Terraform. I took Nana's amazing [Terraform course](https://www.udemy.com/course/complete-terraform-course-beginner-to-advanced/) on Udemy and frequently go back to it for reference.

## License

This project is licensed under the [Creative Commons Attribution 3.0 License](https://creativecommons.org/licenses/by/3.0/).
