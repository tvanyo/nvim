return {
	s(
		{ trig = "#!", dscr = "Expand into base zsh script code" },
		fmta(
			[=[
#!/bin/zsh

main() {
	<>
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]] || [[ "${ZSH_ARGZERO" == "$0" ]]; then
	# Script is being executed directly
	main "$@"
fi
			]=],
			{ i(1, "# enter code here") }
		)
	),
}
