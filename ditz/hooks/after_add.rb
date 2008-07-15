Ditz::HookManager.on :after_add do |project, config, issues|
  issues.each do |issue|
    `git add #{issue.pathname}`
  end
end
