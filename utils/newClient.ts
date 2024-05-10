import { type S3Config } from "~/types";
import { S3Client } from "@aws-sdk/client-s3";

export default function (s3Settings: S3Config): S3Client {
  return new S3Client({
    region: s3Settings.region,
    credentials: {
      accessKeyId: s3Settings.accKeyId,
      secretAccessKey: s3Settings.secretAccKey,
    },
    endpoint: s3Settings.endpoint,
  });
}
