void main(List<String> arguments) {
  var mainCompany = Company("Main", 0.0);

  mainCompany.addSubsidiary(Company("SP", 67836.43));
  mainCompany.addSubsidiary(Company("RJ", 36678.66));
  mainCompany.addSubsidiary(Company("MG", 29229.88));
  mainCompany.addSubsidiary(Company("ES", 27165.48));
  mainCompany.addSubsidiary(Company("Outros", 19849.53));
  
  mainCompany.generatePercentage();

  print(mainCompany.subsidiaries);
}

class Company {
  String? name;
  double? revenue;
  List<Company> subsidiaries = [];
  double subsidiariesRevenue = 0.0;
  double percentage = 0.0;

  Company(this.name, this.revenue);

  void addSubsidiary(Company subsidiary) {
    subsidiaries.add(subsidiary);

    if(subsidiary.revenue != null) {
      subsidiariesRevenue += subsidiary.revenue!;
    }
  }

  void generatePercentage() {
    for(Company subsidiary in subsidiaries) {
      if(subsidiary.revenue != null) {
        subsidiary.percentage = (100 * subsidiary.revenue!) / subsidiariesRevenue;
      }
    }
  }

  @override
  String toString() {
      return "$name - R\$ $revenue - ${percentage.toStringAsFixed(2)}% \n";
  }

}