class SubscriptionDetail {
  final String subscriptionName;
  final String subscriptionType;
  final int amountPerMonthInCents;
  final List subscriptionBenefits;

  const SubscriptionDetail(
      {this.subscriptionName,
      this.subscriptionType,
      this.amountPerMonthInCents,
      this.subscriptionBenefits});

  factory SubscriptionDetail.fromJson(Map<String, dynamic> json) {
    return SubscriptionDetail(
        subscriptionName: json["subscriptionName"],
        amountPerMonthInCents: json["amountPerMonthInCents"],
        subscriptionBenefits: json["subscriptionBenefits"],
        subscriptionType: json["subscriptionType"]);
  }
}

final SubscriptionDetail subscriptionDetailBasic = SubscriptionDetail(
    subscriptionName: "Basic",
    subscriptionType: "sliced@basic",
    amountPerMonthInCents: 799,
    subscriptionBenefits: [
      "Ad free.",
      "Unlimited Movies and TV Shows.",
      "Browse and join a Watch Party."
    ]);

final SubscriptionDetail subscriptionDetailPremium = SubscriptionDetail(
    subscriptionName: "Premium",
    subscriptionType: "sliced@premium",
    amountPerMonthInCents: 1199,
    subscriptionBenefits: [
      "Best Video Quality.",
      "Uninterrupted, ad-free Watch parties.",
      "Host a Watch Party and Invite friends."
    ]);
