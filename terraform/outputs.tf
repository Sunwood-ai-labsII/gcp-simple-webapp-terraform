output "website_url" {
  description = "The URL of the deployed website."
  value       = "https://storage.googleapis.com/${google_storage_bucket.website.name}/index.html"
}
