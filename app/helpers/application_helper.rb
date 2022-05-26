module ApplicationHelper
  def liked_count_of(board)
    board.reactions.where(status: 'like').count
  end

  def page_title(page_title = '')
    base_title = 'Inspigram'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  # meta-tags / OGP
  def default_meta_tags
    {
      reverse: true,
      description: '絵のアイデアを直感的に集めましょう',
      keywords: '',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
      ],
      og: {
        site_name: 'Inspigram',
        title: 'Inspigram',
        description: '絵のアイデアを直感的に集めましょう', 
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.jpg'),
        locale: 'ja_JP',
      },
    }
  end
end
