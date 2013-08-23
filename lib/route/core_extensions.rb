module CoreExtensions
  def require_core_ext
    Dir["#{Rails.root.to_s}/lib/route/*.rb"].each do |f|
      require_dependency f
    end
  end
end