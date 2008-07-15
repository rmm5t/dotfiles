Ditz::HookManager.on :after_delete do |project, config, issues|
  issues.each do |issue|
    `git rm #{issue.pathname}`
  end
end
