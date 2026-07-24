class AddDocumentUrlToAmazonPdfs < ActiveRecord::Migration[7.0]
  def change
    add_column :amazon_pdfs, :document_url, :string
  end
end