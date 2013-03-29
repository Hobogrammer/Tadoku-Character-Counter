require 'jrubyfx'

class CharCountApp < JRubyFX::Application
  def start(stage)
    stage.title = "Character Counter"

    CharCountController.new("textarea.fxml", stage)
    stage.show
  end
end

class CharCountController 
  include JRubyFX::Controller
  
  def initialize
   @text =  find('#test_area')
   @number_label = num_lab
   puts "initialized shit"

    @text.text_property.add_change_listener do |obs, oval, nval|
       @number_label.text = @text.text.length.to_s
    end
  end
end


CharCountApp.launch