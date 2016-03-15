namespace :get do
  task :zsh  do
    system 'cp ~/.zshrc $PWD/zsh/source.zshrc'
    p 'zsh getted'
  end

  task :sublimetext do
    system 'cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings $PWD/sublimetext/'
    p 'sublimetext getted'
  end

  task :prezto do 
    system 'cp ~/.zpreztorc $PWD/prezto/source.zpreztorc'
    p 'prezto getted'
  end
end

namespace :install do
  task :zsh do
    system 'cp $PWD/zsh/source.zshrc ~/.zshrc'
    p 'zsh installed'
  end

  task :sublimetext do
    system 'cp $PWD/sublimetext/*.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings' 
    p 'sublimetext installed'
  end

  task :prezto do 
    system 'cp $PWD/prezto/source.zpreztorc ~/.zpreztorc'
    p 'prezto installed'
  end
end

namespace :push do
  time_o = Time.new
  time = time_o.strftime('%Y-%m-%d %H-%M')

  task :zsh do
    system %{
      git add zsh/source.zshrc zsh/README.md
      git commit -m 'update zsh - #{time}'
      git push
    }
    p 'zsh pushed'
  end

  task :sublimetext do
    system %{
      git add sublimetext/*.sublime-settings sublimetext/README.md 
      git commit -m 'update sublimetext - #{time}'
      git push
    }
    p 'sublimetext pushed'
  end

  task :prezto do 
    system %{
      git add prezto/source.zpreztorc prezto/README.md 
      git commit -m 'update prezto - #{time}'
      git push
    }
    p 'prezto pushed'
  end
end