namespace :myprune do
  desc "Prunes non-premium URls with no visits older than n minutes"
  task :prune_old_urls, [:n] => :environment do |t, args|
    n = args.n.to_i || 10
    puts "Pruning old links..."
    ShortenedUrl.prune(n)    
  end
end