ActiveAdmin.register Project do
  permit_params :category_id,
                :target_price,
                :ended_at,
                :success_condition,
                :title,
                :short_blurb,
                :video_url,
                :body,
                :main_image,
                sub_images: []

  member_action :delete_project_image, method: :delete do
    @pic = ActiveStorage::Attachment.find(params[:id])
    @pic.purge
    redirect_to admin_root_path, notice: "Deleted image"
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :target_price
      f.input :ended_at
      f.input :success_condition
      f.input :title
      f.input :short_blurb
      f.input :video_url
      f.input :body
      f.input :main_image, as: :file
      if f.object.main_image.attached?
        span image_tag(url_for f.object.main_image)
        span link_to "delete", delete_project_image_admin_project_path(f.object.main_image.id), method: :delete, data: { confirm: "Are you sure?" }
      end
      f.input :sub_images, as: :file, input_html: { multiple: true }
      if f.object.sub_images.attached?
        f.object.sub_images.each do |img|
          span image_tag(img)
          span link_to "delete",delete_project_image_admin_project_path(img.id),method: :delete,data: { confirm: 'Are you sure?' }
        end
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :category
      row :target_price
      row :ended_at
      row :success_condition
      row :title
      row :short_blurb
      row :video_url
      row :body
      row(:main_image) {|row| image_tag url_for row.main_image }
    end
    panel "sub images" do
      table_for project.sub_images do
        column(:image) { |sub_image| image_tag url_for sub_image }
      end
    end
  end
end
