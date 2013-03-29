require 'jrubyfx'

class CharCountApp < JRubyFX::Application
  def start(stage)
    stage.title = "Character Counter"

    CharCountController.new("chararea.fxml", stage, fill: :grey)
    stage.show
  end
end

class CharCountController 
  include JRubyFX::Controller
  
  def initialize
   @chars =  count_txt
   @char_count = count_label

    @chars.text_property.add_change_listener do |obs, oval, nval|
       @char_count.text = @chars.text.length.to_s
    end
  end
end


CharCountApp.launch