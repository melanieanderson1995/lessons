def send_email_to(user)
  mail = Mail.new(clean_email(user))

  mail.send_message
end

def clean_email(user)
  email = email.strip
end


class BroswerPageChooser
  def send_correct_page(browser, window)
    safari_small_message = "You are using the Safari browser in a small window."

    not_safari_or_big = "You are not using the Safari browser or have a big window."
    browser = Attributes.new.safari?
    window = Attributes.new.small?

    browser(browser) && window(window) ? safari_small_message : not_safari_or_big
  end
end

class Attributes
  def safari?(browser)
    browser_is_safari = browser.type == "Safari"
  end

  def small?(window)
      window_is_small = window.size < "768px"
  end
end
