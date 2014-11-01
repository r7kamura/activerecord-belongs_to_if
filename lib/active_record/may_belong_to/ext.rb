ActiveSupport.on_load(:active_record) do
  ActiveRecord::Associations::Preloader.prepend(ActiveRecord::MayBelongTo::PreloaderExtension)
  ActiveRecord::Base.extend(ActiveRecord::MayBelongTo::ClassMethods)
  ActiveRecord::Reflection.singleton_class.prepend(ActiveRecord::MayBelongTo::ReflectionExtension)
end
