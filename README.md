# 🌐 GCP Simple Webapp with Terraform 🌐

GCP の Cloud Storage を使って Terraform で静的サイトをデプロイするサンプルです。
本リポジトリは [gemini-actions-lab の Issue #66](https://github.com/Sunwood-ai-labsII/gemini-actions-lab/issues/66) をもとに、Gemini で生成した内容を整理したものです。

## 🚀 使い方 (How to Use)

### 前提条件

- Google Cloud SDK (`gcloud`) がインストールされており、ログイン済みであること
- Terraform がインストールされていること
- デプロイ先となる GCP プロジェクトを用意していること

### デプロイ手順

1. **まずリポジトリをクローン**
   ```bash
   git clone https://github.com/Sunwood-ai-labsII/gcp-simple-webapp-terraform.git
   cd gcp-simple-webapp-terraform
   ```

2. **GCP プロジェクトの設定**
   `terraform` ディレクトリの `terraform.tfvars` を作成して、使用する GCP プロジェクト情報を記入します。サンプルとして `terraform/terraform.tfvars.example` も用意しているので、コピーして編集してください。
   ```tfvars
   # terraform/terraform.tfvars
   gcp_project_id = "your-gcp-project-id-here"
   # 任意 (デフォルト us-central1)
   gcp_region     = "us-central1"
   ```

3. **gcloud で Application Default Credentials を設定**
   Terraform の Google プロバイダーが使用する認証情報を取得します。
   ```bash
   gcloud auth application-default login
   ```

4. **Terraform の初期化**
   `terraform` ディレクトリへ移動して初期化します。
   ```bash
   cd terraform
   terraform init
   ```

5. **Terraform を実行**
   設定内容を確認して問題なければ `yes` と入力します。
   ```bash
   terraform apply
   ```

6. **サイトにアクセス**
   デプロイが完了すると Terraform の出力に静的サイトの URL が表示されるので、ブラウザでアクセスしてください。

## 📁 ファイル構成

- `index.html`: デプロイされるシンプルなトップページ
- `terraform/`: Terraform の構成ファイル群
  - `main.tf`: GCS バケットや静的サイトホスティングのリソース定義
  - `variables.tf`: プロジェクト ID やリージョンなどの変数定義
  - `outputs.tf`: デプロイ後のサイト URL を出力

## 🧹 後片付け

不要になったリソースを削除するときは次を実行します。
```bash
cd terraform
terraform destroy
```
