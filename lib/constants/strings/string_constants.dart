class StringConstants {
  static const String meditoFundraising = 'Medito Fundraising';
  static const String donation = 'Donation';
  static const String share = 'Share';
  static const String qAndA = 'Q&A';
  static const String rewards = 'Rewards';
  static const String donateNow = 'Donate Now';
  static const String recentDonations = 'Recent Donations';
  static const String donationTiersAndRewards =  'Donation Tiers and Rewards';
  static const String faq = 'FAQs';
  static const String amountRaised = 'Amount Raised';
  static const String submit = 'Submit';
  static const String emailAddress = 'Email address';
  static const String campaignTitle = 'Medito Fundraising';
  static const String enterYourName = 'Enter your name';
  static const String enterYourEmail = 'Enter your email';
  static const String enterDonationAmount = 'Enter donation amount';
  static const String messageToCommunity = 'Message to community';
  static const String question = 'Question?';
  static const String isThereSomethingElse = 'Is there something else?';
  static const String enterValidAmount = 'Please enter a valid amount';
  static const String enterValidNumber = 'Please enter a valid number';
  static const String invalidEmail = 'Invalid Email.';
  static const String fieldRequired = 'Field is Required';
  static const String invalidInput = 'Invalid Input';
  static const String campaignDescription = """Title and Description:
A clear and adjustable title that can be set to reflect the current fundraising goal (e.g., "Create Ad Campaign in the Tram").
A brief description that contextualizes the fundraising initiative.
Fundraising Progress Indicator:
Display dynamically the amount raised towards the goal (dummy data, but can be replaced by an API endpoint).
Visually represent progress in both numerical value and percentage.
Implement an animated progress bar that activates upon page load.
Interactive Q&A Dropdowns:
Include customizable questions relevant to the fundraising goal.
Dropdowns to reveal answers for each question.
The final dropdown to contain an inline form asking for the user's email address to prevent spam and allow for follow-up queries.
Donation Section:
An input field for donors to specify an amount, with validation to ensure it's a legitimate figure.
Integration with Stripe checkout for secure transactions, with support for multiple currencies.
A donation button that is prominently displayed and accessible.
Rewards for Donors:
A flexible rewards section where incentives can be outlined based on donation tiers. (can be mixed with the donation section)
Dynamic Notification Bar:
A notification feature at the top of the page that showcases recent donations.
The ability to connect this feature to an API endpoint, allowing for real-time updates at specified intervals.
""";
}
