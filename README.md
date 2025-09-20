<p align="center">
  <img src="./header.webp" alt="GCP Simple Webapp header" width="100%">
</p>

<h1 align="center">GCP Simple Webapp with Terraform</h1>

<p align="center">
  <a href="https://www.terraform.io"><img src="https://img.shields.io/badge/IaC-Terraform-7B42BC" alt="Terraform badge"></a>
  <a href="https://cloud.google.com"><img src="https://img.shields.io/badge/Cloud-Google%20Cloud-1a73e8" alt="Google Cloud badge"></a>
  <a href="https://cloud.google.com/storage"><img src="https://img.shields.io/badge/Storage-GCS-34a853" alt="Google Cloud Storage badge"></a>
</p>

<p align="center">Google Cloud Storage と Terraform で静的サイトを公開する最小構成のサンプルです。</p>


## 🚀 概要
このリポジトリでは、Terraform を使って Google Cloud Storage に静的ウェブサイトをデプロイする手順をまとめています。小規模な構成から学びたい、あるいはチームでの IaC 運用を試したい場合のスターターとして活用できます。

## 🧰 必要環境
- 課金が有効な Google Cloud プロジェクト
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)（`gcloud auth login` 済み）
- [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.5 以上
- Cloud Storage バケットを作成できる権限

## ⚙️ セットアップ手順
1. **リポジトリを取得**
   ```bash
   git clone https://github.com/Sunwood-ai-labsII/gcp-simple-webapp-terraform.git
   cd gcp-simple-webapp-terraform
   ```
2. **変数ファイルを準備**
   ```bash
   cp terraform/terraform.tfvars.example terraform/terraform.tfvars
   ```
   エディタで `terraform/terraform.tfvars` を開き、以下の値を自分の環境に合わせて設定します。
   ```hcl
   gcp_project_id = "あなたのGCPプロジェクトID"
   gcp_region     = "us-central1"
   ```
3. **Application Default Credentials を設定**
   ```bash
   gcloud auth application-default login
   ```
4. **Terraform を初期化**
   ```bash
   cd terraform
   terraform init
   ```

## 🧪 利用方法
1. **実行プランを確認**
   ```bash
   terraform plan
   ```
2. **インフラを適用**
   ```bash
   terraform apply
   ```
   プロンプトが表示されたら `yes` と入力します。Terraform が公開バケットを作成し、`index.html` をアップロードします。
3. **サイトにアクセス**
   実行後に出力される `website_url` をブラウザで開き、デプロイされたページを確認します。

## 🧼 後片付け
作成したリソースを削除するには以下を実行します。
```bash
terraform destroy
```
確認で `yes` を入力すると、バケットとアップロードしたファイルが削除されます。

## 🗂️ ディレクトリ構成
- `README.md` - プロジェクトの概要と手順
- `header.webp` - README 冒頭で使用するヘッダー画像
- `index.html` - サンプルの静的ウェブページ
- `terraform/` - Terraform 設定一式
  - `main.tf` - バケット・IAM・オブジェクトの定義
  - `variables.tf` - 入力変数の定義
  - `outputs.tf` - デプロイ後の公開 URL を出力
  - `terraform.tfvars.example` - 変数ファイルの雛形
- `docs/` - 参考用の図表やスクリーンショット

## 📎 参考リンク
- [Google Cloud Storage で静的サイトをホスティングする](https://cloud.google.com/storage/docs/hosting-static-website)
- [Terraform Google Provider ドキュメント](https://registry.terraform.io/providers/hashicorp/google/latest/docs)

> 💡 **Tips:** `terraform.tfvars`, `terraform.tfstate`, `.terraform/` など機密性のあるファイルはコミットしないよう `.gitignore` を更新しましょう。
