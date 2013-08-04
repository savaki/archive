archive
=======

creates vagrant image to manage personal debian repo

## Required Environment Variables

|Name|Required|Value|
|:---|:-------|:----|
|AWS_ACCESS_KEY_ID|yes|aws credential|
|AWS_SECRET_ACCESS_KEY|yes|aws credentials|
|S3_BUCKET|yes|the s3 bucket that will be the repo|

## using the debian repo

This package assume the libraries will be accessible via the following entry in sources.list

```
deb http://hostname/ precise universe
```

## Example - archive.mattho.com

For example, archive.mattho.com, points to an internal S3 repo, savaki-debian-repo.  Here's how I would modify sources.list to include my repo

```
cat <<EOF | sudo tee -a /etc/apt/sources.list
deb http://archive.mattho.com/ precise universe
EOF
```

## Notes

Note that this tool does not create a signed debian repository, so you'll need to add the --force-yes flag when using apt-get.


