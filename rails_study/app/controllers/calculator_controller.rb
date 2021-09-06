class CalculatorController < ApplicationController
  def main
  end

  def result
    @fristNum = Integer(params[:num1])
    @secondNum = params[:num2].to_i
    @result = @fristNum + @secondNum
  end

  def plus
    @fristNum = Integer(params[:num1])
    @secondNum = params[:num2].to_i
    @result = @fristNum + @secondNum
  end
end
