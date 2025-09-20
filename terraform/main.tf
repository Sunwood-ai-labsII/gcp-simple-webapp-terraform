terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

# GCSバケットを作成して、静的サイトホスティングを有効にするよん
resource "google_storage_bucket" "website" {
  # バケット名は世界でユニークじゃないとダメだから、プロジェクトIDを頭につけるのがオススメ！
  name          = "${var.gcp_project_id}-simple-webapp"
  location      = "US" # 静的サイトならマルチリージョンが安定っしょ
  force_destroy = true # terraform destroyしたときにバケットにファイルあっても消せるようにするやつ

  website {
    main_page_suffix = "index.html"
  }
}

# 作ったバケットを全世界に公開する設定！これでみんなが見れるようになる
resource "google_storage_bucket_iam_member" "public_reader" {
  bucket = google_storage_bucket.website.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

# ローカルのindex.htmlをGCSバケットにアップロードするよ
resource "google_storage_bucket_object" "index_html" {
  name         = "index.html"
  bucket       = google_storage_bucket.website.name
  source       = "../index.html" # terraformディレクトリから見たときのパスね
  content_type = "text/html"
}
