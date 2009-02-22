# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def line_chart_url(options)
    
    options.merge(:title => '', :x => nil)
    
    chart = GoogleChart.new 
    chart.type = :line 
    data = options[:y]
    label = options[:x]
    chart.title = options[:title] 
    chart.data = data
    chart.labels = label 
    chart.height = 400 
    chart.width = 750 
    
    min = data.min * 0.99
    max = data.max * 1.01
    y_label = [min, min + (max-min)/2, max].map {|d| d.round}
    
    chart_params = {}
    chart_params[:y_range]      = "chds=#{min},#{max}"
    chart_params[:axis]         = "chxt=x,y"
    chart_params[:axis_label]   = "chxl=1:|#{y_label.join('|')}"
    chart_params[:data_marker]  = "chm=o,C1CDCD,0,-1,8"
    chart_params[:bg_color]     = "chf=c,lg,90,1A1A1A,0.5,525252,0|bg,s,EFEFEF"

    chart.to_url + "&" + chart_params.values.join('&')
  end
  
end
