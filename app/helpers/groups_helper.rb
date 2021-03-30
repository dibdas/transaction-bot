module GroupsHelper
  def format_group(groups)
    result = ''
    groups.each do |t|
      result << '<div>'
      result << image_tag(t.icon, style: 'height:10em;')
      result << '  Group name:   ' << '  ' << link_to(t.name, group_path(t.id)) << '  '
      result << 'Transaction by:  ' << t.user.username << '    '
      result << ' Created at: ' << t.created_at.to_formatted_s(:short)
      result << '</div>'
    end
    result.html_safe
  end



def show_group(group)
    result = ''
    group.each do |t|
      result << '<div>'
      result << image_tag(t.group.icon, style: 'height:10em;')
      result << '  Group name:   ' << '  ' << t.name << '  '
      result << 'Transaction by:  ' << t.user.username << '    '
      result << ' Created at: ' << t.created_at.to_formatted_s(:short)
      result << '</div>'
    end
    result.html_safe
  end
end
