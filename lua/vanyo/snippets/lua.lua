return {
	s(
		"req",
		fmt(
			"local {} = require('{}')\nlocal {} = {}.{}",
			{ i(1, "default"), i(2, "foobar"), i(3, "barfoo"), rep(1), i(4, "default") }
		)
	),
}
