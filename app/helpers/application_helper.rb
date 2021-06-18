module ApplicationHelper
  def format_timeline(time_line)
    time_line.strip!
    time_line_array = time_line.split("\n")
    colorize = true
    time_line_array.each_with_index do |line, i|
      if line.match? /\A[0-9]*[. , :].*/
        if time_line_array[i-1] && time_line_array[i-1].match?(/\A(<p>)/)
          time_line_array[i] = "<p class=\"bg-gray-200 py-1 px-2 mt-2\">" + line + "</p>"
          colorize = false
        elsif colorize
          time_line_array[i] = "<p class=\"bg-gray-200 py-1 px-2\">" + line + "</p>"
          colorize = !colorize
        else
          time_line_array[i] = "<p class=\"py-1 px-2\">" + line + "</p>"
          colorize = !colorize
        end
        # raise "s"
      else
        if time_line_array[i-1] && time_line_array[i-1].match?(/\A(<p class)/)
          time_line_array[i] = "<p class=\" mt-2 \">" + line + "</p>"
        else
          time_line_array[i] = "<p>" + line + "</p>"
        end
      end
    end
    time_line_array.join(' ').html_safe
  end
end
