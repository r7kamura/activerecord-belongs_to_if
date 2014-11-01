ActiveSupport.on_load(:active_record) do
  ActiveRecord::Associations::Builder::BelongsTo.prepend(ActiveRecord::BelongsToIf::BuilderExtension)
  ActiveRecord::Associations::Preloader::BelongsTo.prepend(ActiveRecord::BelongsToIf::PreloaderExtension)
end
