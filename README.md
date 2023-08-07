# Zenn CLI

* [📘 How to use](https://zenn.dev/zenn/articles/zenn-cli-guide)

# デプロイ
```
GCLOUD_PROJECT=visionary-flutter-playground

gcloud config set project "$GCLOUD_PROJECT"
gcloud auth configure-docker

docker build -t "gcr.io/$GCLOUD_PROJECT/zenn-preview" .
docker push "gcr.io/$GCLOUD_PROJECT/zenn-preview"

service_name="visionary-flutter-playground"

gcloud run deploy "$service_name" \
  --image "gcr.io/$GCLOUD_PROJECT/zenn-preview" \
  --port 8000 \
  --platform managed \
  --allow-unauthenticated \
  --region asia-northeast1

```