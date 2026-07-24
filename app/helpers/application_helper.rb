module ApplicationHelper
	IMAGE_ASSET_EXTENSIONS = %w[png jpg jpeg webp gif svg].freeze

	def stock_image_asset_options
		@stock_image_asset_options ||= begin
			base_path = Rails.root.join("app/assets/images")
			glob_pattern = base_path.join("**", "*.{#{IMAGE_ASSET_EXTENSIONS.join(',')}}").to_s

			Dir.glob(glob_pattern)
				.sort
				.map { |path| Pathname(path).relative_path_from(base_path).to_s }
		end
	end

	def resolve_image_src(source, fallback: "default-hero.jpg")
		normalized = source.to_s.strip
		fallback_normalized = fallback.to_s.strip.presence

		if normalized.blank?
			return resolve_image_src(fallback_normalized, fallback: nil) if fallback_normalized.present?
			return
		end

		return normalized if normalized.match?(%r{\A(?:https?:)?//}) || normalized.start_with?("/", "data:")

		image_path(normalized)
	rescue StandardError
		if fallback_normalized.present? && fallback_normalized != normalized
			return resolve_image_src(fallback_normalized, fallback: nil)
		end

		"/#{normalized}"
	end
end
