class Note
  def initialize(title, body, note = NoteFormatter.new)
    @title = title
    @body = body
    @formatter = note
  end

  def display
    @formatter.format(self)
  end

  attr_reader :title, :body
end

class NoteFormatter
  def format(note)
    "Title: #{note.title}\n#{note.body}"
  end
end



class Diary
  def initialize
    @entries = []
  end

  def add(title, body, entry = Entry.new(title, body))
    @entries << entry
  end

  def index
    titles = @entries.map do |entry|
      entry.title
    end
    titles.join("\n")
  end
end

class Entry
  def initialize(title, body)
    @title = title
    @body = body
  end

  attr_reader :title, :body
end



class EmailClient
  def initialize(message = Message.new)
    @message = message
  end

  def message
    return @message
  end
end

class Message
  def send(to, body)
    # Imagine I'm sending an email
  end
end

class SayHello
  def initialize(emailclient = EmailClient.new)
    @email = emailclient
  end

  def run
    @email.message.send(
      "friend@example.com",
      "HELLO!"
    )
  end
end
