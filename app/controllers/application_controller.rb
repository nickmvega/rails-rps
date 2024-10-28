class ApplicationController < ActionController::Base
  def home
    render({ template: "layouts/home" })
  end

  def rock
    @user_move = "rock"
    move
  end

  def paper
    @user_move = "paper"
    move
  end

  def scissors
    @user_move = "scissors"
    move
  end

  def move
    @computer_move = ["rock", "paper", "scissors"].sample
    @result = winner(@user_move, @computer_move)
    render({ template: "layouts/move" })
  end

  def winner(user_move, computer_move)
    if user_move == computer_move
      return "We tied!"
    end
  
    if (user_move == "rock" && computer_move == "scissors") ||
       (user_move == "paper" && computer_move == "rock") ||
       (user_move == "scissors" && computer_move == "paper")
      "We won!"
    else
      "We lost!"
    end
  end
end
