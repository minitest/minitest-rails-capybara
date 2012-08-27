require "rails_helper"

describe "Capybara Matchers View Test" do
  
  CONTENT = "<!DOCTYPE html><title>TestApp</title>
            <h1>Hello <span>World</span></h1>
            <nav><ul><li><a href='/'>home</a></li></ul></nav>
            <p><label>Email Address<input type='text'></label></p>
            <button>random button</button>
            <label>going<input type='checkbox' checked='checked'></label>
            <label>avoid<input type='checkbox'></label>"

  describe "have_content" do
    it "rendered with content" do
      render inline: CONTENT
      assert_have_content rendered, "Hello World"
      refute_have_content rendered, "Goobye All!"                
      rendered.must_have_content    "Hello World"
      rendered.wont_have_content    "Goobye All!"
    end

    describe "with subject" do
      before  { render inline: CONTENT }
      subject { rendered }
    
      it { must have_content("Hello World") }
      it { wont have_content("Goobye All!") }
      must { have_content("Hello World") }
      wont { have_content("Goobye All!") }
    end
  end
  
  describe "have_selector" do
    it "rendered with heading" do
      render inline: CONTENT
      assert_have_selector rendered, "h1"
      refute_have_selector rendered, "h3"
      rendered.must_have_selector    "h1"
      rendered.wont_have_selector    "h3"
    end
  
    describe "with subject" do
      before  { render inline: CONTENT }
      subject { rendered }
  
      it { must have_selector("h1") }
      it { wont have_selector("h3") }
      must { have_selector("h1") }
      wont { have_selector("h3") }
    end
  end
  
  describe "have_link" do
    it "has a link to home" do
      render inline: CONTENT
      assert_have_link rendered, "home"
      refute_have_link rendered, "away"
      rendered.must_have_link    "home"
      rendered.wont_have_link    "away"
    end
  
    describe "with subject" do
      before  { render inline: CONTENT }
      subject { rendered }
  
      it { must have_link("home") }
      it { wont have_link("away") }
      must { have_link("home") }
      wont { have_link("away") }
    end
  end
  
  describe "have_field" do
    it "has a button to submit" do
      render inline: CONTENT
      assert_have_field rendered, "Email Address"
      refute_have_field rendered, "Bank Account"
      rendered.must_have_field    "Email Address"
      rendered.wont_have_field    "Bank Account"
    end
  
    describe "with subject" do
      before  { render inline: CONTENT }
      subject { rendered }
  
      it { must have_field("Email Address") }
      it { wont have_field("Bank Account") }
      must { have_field("Email Address") }
      wont { have_field("Bank Account") }
    end
  end
  
  describe "have_button" do
    it "has a button to login" do
      render inline: CONTENT
      assert_have_button rendered, "random button"
      refute_have_button rendered, "missing button"
      rendered.must_have_button    "random button"
      rendered.wont_have_button    "missing button"
    end
  
    describe "with subject" do
      before  { render inline: CONTENT }
      subject { rendered }
  
      it { must have_button("random button") }
      it { wont have_button("missing button") }
      must { have_button("random button") }
      wont { have_button("missing button") }
    end
  end
  
  describe "have_checked_field" do
    it "has a button to submit" do
      render inline: CONTENT
      assert_have_checked_field rendered, "going"
      refute_have_checked_field rendered, "avoid"
      rendered.must_have_checked_field    "going"
      rendered.wont_have_checked_field    "avoid"
    end
  
    describe "with subject" do
      before  { render inline: CONTENT }
      subject { rendered }
  
      it { must have_checked_field("going") }
      it { wont have_checked_field("avoid") }
      must { have_checked_field("going") }
      wont { have_checked_field("avoid") }
    end
  end
  
  describe "have_unchecked_field" do
    it "has a button to submit" do
      render inline: CONTENT
      assert_have_unchecked_field rendered, "avoid"
      refute_have_unchecked_field rendered, "going"
      rendered.must_have_unchecked_field    "avoid"
      rendered.wont_have_unchecked_field    "going"
    end
  
    describe "with subject" do
      before  { render inline: CONTENT }
      subject { rendered }
  
      it { must have_unchecked_field("avoid") }
      it { wont have_unchecked_field("going") }
      must { have_unchecked_field("avoid") }
      wont { have_unchecked_field("going") }
    end
  end

end
