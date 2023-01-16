# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# You can add backtrace silencers for libraries that you're using but don't wish to see in your backtraces.
<<<<<<< HEAD
# Rails.backtrace_cleaner.add_silencer { |line| /my_noisy_library/.match?(line) }

# You can also remove all the silencers if you're trying to debug a problem that might stem from framework code
# by setting BACKTRACE=1 before calling your invocation, like "BACKTRACE=1 ./bin/rails runner 'MyClass.perform'".
Rails.backtrace_cleaner.remove_silencers! if ENV['BACKTRACE']
=======
# Rails.backtrace_cleaner.add_silencer { |line| line =~ /my_noisy_library/ }

# You can also remove all the silencers if you're trying to debug a problem that might stem from framework code.
# Rails.backtrace_cleaner.remove_silencers!
>>>>>>> ca8170c5bcc79d6cf8b14e3aca0e95b86eb60666
