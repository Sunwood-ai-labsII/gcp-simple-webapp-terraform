# 💖 GCP Simple Webapp with Terraform 💖

GCPのCloud Storageを使って、Terraformでサクッと静的サイトをデプロイするサンプルだよ！
このリポジトリは、[gemini-actions-lab の Issue #66](https://github.com/Sunwood-ai-labsII/gemini-actions-lab/issues/66) をもとに、Geminiちゃんで自動生成されたんだよ✨ すごくな〜い？

## 🚀 使い方 (How to Use)

### 準備するもの

- Google Cloud SDK (`gcloud`) がインストールされてて、ログイン済みであること
- Terraform がインストールされてること
- GCPのプロジェクトがあること

### デプロイ手順

1.  **まずこのリポジトリをクローンするっしょ！**
    ```bash
    git clone https://github.com/Sunwood-ai-labsII/gcp-simple-webapp-terraform.git
    cd gcp-simple-webapp-terraform
    ```

2.  **GCPプロジェクトの設定**
    `terraform` ディレクトリに `terraform.tfvars` ってファイルを作って、自分のGCPプロジェクトIDを書き込むの！
    ```tfvars
    # terraform/terraform.tfvars

    gcp_project_id = "your-gcp-project-id-here"
    ```

3.  **Terraformの初期化**
    `terraform` ディレクトリに移動して、おまじないを唱える🙏
    ```bash
    cd terraform
    terraform init
    ```

4.  **Terraformプランを実行！**
    どんなものが作られるか確認して、`yes` って入力すればデプロイ開始！
    ```bash
    terraform apply
    ```

5.  **サイトにアクセス！**
    デプロイが終わったら、TerraformがサイトのURLを教えてくれるから、それにアクセスしてみてね！

## 📂 ファイル構成

- `index.html`: 超かわいいトップページだよん💖
- `terraform/`: Terraformのコードが入ってるフォルダ
  - `main.tf`: GCSのリソースを定義してるメインファイル
  - `variables.tf`: プロジェクトIDとかの変数を定義してるファイル
  - `outputs.tf`: デプロイしたサイトのURLとかを出力するためのファイル

## 🧹 お片付け

作ったリソースを消したいときは、このコマンドを実行してね。
```bash
cd terraform
terraform destroy
```