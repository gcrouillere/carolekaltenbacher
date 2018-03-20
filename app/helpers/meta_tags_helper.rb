module MetaTagsHelper
  def meta_title
    content_for?(:title_tag) ? content_for(:title_tag) : "CaroleK.ceramique, les céramiques uniques de Carole Kaltenbacher"
  end

  def meta_product_name
    content_for?(:meta_product_name) ? content_for(:meta_product_name) : "CaroleK.ceramique - vente de céramiques contemporaines"
  end

  def meta_description
    description = "Vente de céramiques et poteries artisanales réalisées par Carole Kaltenbacher. Découvrez dans la boutique mes créations uniques. Vous y retrouverez des céramiques utilitaires et décoratives. Venez découvrir leur fabrication lors d'un stage."
    content_for?(:description) ? content_for(:description) : description
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image).strip : image_path(ENV['HOMEPIC']))
    # little twist to make it work equally with an asset or a url
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end

