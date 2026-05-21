module ApplicationHelper
  ADMIN_HTML_TAGS = %w[p a ul ol li h3 strong br].freeze

  def sanitize_admin_html(html)
    sanitize(html, tags: ADMIN_HTML_TAGS, attributes: %w[href target rel class])
  end

  def diary_entry_image(entry, css_class: "align-right")
    return if entry.image.blank?

    if entry.image.start_with?("http://", "https://")
      tag.img(src: entry.image, alt: entry.image_alt.presence || "", class: css_class)
    else
      image_tag(entry.image, alt: entry.image_alt.presence || "", class: css_class)
    end
  end

  def format_diary_date(date)
    return "" if date.blank?

    "#{date.year}.#{date.month}.#{date.day}"
  end

  def format_update_log_date(date)
    return "" if date.blank?

    date.strftime("%Y/%m/%d")
  end
end
