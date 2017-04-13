class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

# code goes below

    text_only = @text.downcase.gsub("\n","").gsub("\r","").gsub("\t","").gsub(" ","")
    clean_text = @text.downcase
    char_count = clean_text.length
    char_count_no = clean_text.gsub(" ","").length
    words = clean_text.split.count

    ocurrr =[]
    ocur = clean_text.gsub(/[^a-z0-9\s]/i, "").split
    ocur.each do |txt|
      if txt == @special_word
        ocurrr.push(1)
      else
        ocurrr.push(0)
      end
    end




    @word_count = words

    @character_count_with_spaces = char_count

    @character_count_without_spaces = char_count_no

    @occurrences = ocurrr.sum

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
    monthly_rate = @apr / 12 /100
    payment = (monthly_rate * @principal * ((1+monthly_rate)**(12*@years))) / (((1+monthly_rate)**(12*@years))-1)
    # P = [i L (1 + i)^n] / [(1 + i)^n - 1].

    @monthly_payment = payment

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ===============================================================================

    @seconds = @ending - @starting
    @minutes = @seconds / 60
    @hours = @minutes / 60
    @days = @hours / 24
    @weeks = @days / 7
    @years = @weeks / 52

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================




    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max - @numbers.min

    if @sorted_numbers.length.to_f % 2 == 0
    high = (@sorted_numbers.length / 2 )
      low = ( (@sorted_numbers.length / 2 ) ) - 1
      # high = (@sorted_numbers.length.to_f / 2 ).ceil
      medn = (@sorted_numbers[low]+@sorted_numbers[high]).to_f / 2
    else
      idx = (@sorted_numbers.length / 2 ).floor
      medn = @sorted_numbers[idx]
    end


    @median = medn

    @sum = @numbers.sum

    @mean = @numbers.sum / @numbers.length

    

    @variance = "Replace this string with your answer."

    @standard_deviation = "Replace this string with your answer."

    @mode = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
