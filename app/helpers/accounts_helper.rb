module AccountsHelper
  def format_accounts(accounts)
    result = ''
    accounts.each do |t|
      result << "<div class='card'>"
      result << ' Transaction name: ' << t.name << '  '
      result << " Amount:$#{t.amount} " << ' '
      result << ' Group name:   ' << '  ' << t.group.name << '  '
      result << 'Created by:  ' << t.user.username << '    '
      result << ' Created at: ' << t.created_at.to_formatted_s(:short)
      result << ' ' << link_to('edit', edit_account_path(t.id)) << ' '
      result << ' ' << link_to('delete', account_path(t.id), data: { confirm: 'Are you sure?' },
                                                             method: :delete) << ' '
      result << '</div>'
    end
    result.html_safe
  end

  def format_external_accounts(external_for_user_transactions)
    result = ''
    external_for_user_transactions.each do |t|
      result << "<div class='card'>"
      result << 'Transaction name:'<<t.name
      result << " Amount:$#{t.amount} " << ' '
      result << 'Created by:  ' << t.user.username << '    '
      result << ' Created at: ' << t.created_at.to_formatted_s(:short)
      result << ' ' << link_to('edit', edit_account_path(t.id)) << ' '
      result << ' ' << link_to('delete', account_path(t.id), data: { confirm: 'Are you sure?' },
                                                             method: :delete) << ' '
      result << '</div>'
    end
    result.html_safe
  end
end
