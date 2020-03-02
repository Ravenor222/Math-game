class Questions
  attr_accessor :num1, :num2, :operator_num, :answer, :correct, :operator
  def initialize
    @num1 = (rand(1..10))
    @num2 = (rand(1..10))
    @operator_num = (rand(4))
    @correct = nil
    @operator_array = [:+, :-, :*, :/]
    @operator = @operator_array[@operator_num]
    @answer = num1.send(@operator, num2)

end

  def pose_question
    puts "What does #{num1} #{operator} #{num2} equal?"

    if gets.chomp.to_i == @answer
      puts "YES! You are correct"
      @correct = true;
    else 
      puts "Seriously? No!"
      puts "The answer is #{@answer}"
      @correct = false;
    end
  end

  def question_right?
    if @correct == true
      return true
    else
      return false
    end
  end

end
