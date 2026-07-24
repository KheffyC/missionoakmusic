module ApplicationHelper
	def resolve_image_src(source)
		normalized = source.to_s.strip
		return if normalized.blank?

		return normalized if normalized.match?(%r{\A(?:https?:)?//}) || normalized.start_with?("/", "data:")

		image_path(normalized)
	rescue Sprockets::Rails::Helper::AssetNotFound
		normalized
	end
end
