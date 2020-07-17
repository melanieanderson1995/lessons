=begin
  class: Note
  instance variable: @content, @tag
  method: initialize(content, tag)
  class: Notebook
  instance variable: @notes
  method: create(content, tag)
  class: Notebook
  instance variable: @tag
  method: search(tag)
=end

class Note 
  attr_reader :tag  
  def initialize(content, tag) 
    @content = content 
    @tag = tag 
  end
  end 

 class NoteBook 
  attr_reader :notes  

  def initialize 
    @notes = [] 
  end  

  def create(content, tag) 
    note = Note.new(content, tag) 
    notes << note 
  end  

  def search(tag) 
    notes.select { |note| note.tag == tag} 
  end
  end

=begin
class Note
  def self.new_note(content)
    content
  end
end

class Notebook
  attr_reader :notes

  def initialize
    @notes = Hash.new { |k,v| k[v] = [] }
  end

  def create_note(tag,content)
    @notes[tag] << Note.new_note(content)
  end

  def find(tag)
    @notes[tag]
  end
end
=end
