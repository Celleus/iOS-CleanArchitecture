.PHONY: generate-module
generate-module: # Generate VIPER module
	mint run genesis generate ./Genesis/Templates/GenesisCleanTemplate/template.yml --options "date:$(shell date +%Y/%m/%d)" --option-path BootstrapOptions.yml