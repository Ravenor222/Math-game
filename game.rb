class Game
  def initialize()
    @active = true;
    @user_turn = 0;
    @player1 = Player.new('player 1')
    @player2 = Player.new('player 2')
  end

  def start_game
    puts "------Game Start------"

    while @active
      if @user_turn == 0
        puts "-------New Turn-------"
        puts "Player 1, go at it!"
        q1 = Questions.new
        q1.pose_question
        
        if q1.question_right?
          @user_turn = 1
        else 
          @player1.lose_life
          @user_turn = 1
        end
        puts "#{@player1.name} : #{@player1.life}/3 VS #{@player2.name} : #{@player2.life}/3"
      end

      if @user_turn == 1
        puts "-------New Turn-------"
        puts "Player 2, go at it!"
        q2 = Questions.new
        q2.pose_question

        if q2.question_right?
          @user_turn = 0
        else 
          @player2.lose_life
          @user_turn = 0
        end
        puts "#{@player1.name} : #{@player1.life}/3 VS #{@player2.name} : #{@player2.life}/3"
      end  

      if @player1.life == 0 || @player2.life == 0
        @active = false
        if @player1.life > @player2.life
          puts "Player 1 wins with a score of #{@player1.life}/3"
        else
          puts "Player 2 wins with a score of #{@player2.life}/3"
        end
      end
    end
    puts "-------GAME OVER-------"
    puts "Goodbye!"
  end


end