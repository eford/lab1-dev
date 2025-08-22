### A Pluto.jl notebook ###
# v0.20.13

using Markdown
using InteractiveUtils

# ╔═╡ ab976d70-f59d-4dcd-ac89-771606a74108
begin
	using PlutoUI
	using PlutoTest 
	using PlutoTeachingTools
end

# ╔═╡ 5b826e17-ad51-43d0-9756-89a9fd0ea834
md"""
# Astro 528, Lab 1, Exercise 1
"""

# ╔═╡ acb10cb1-d03d-47c5-90dc-7216e5110ed2
md"""
## Access the lab
Before we delve into the meat of the course, we'll practice accessing the assignment via your private git repository ("repo"), cloning the repo, starting Julia, and launching the Pluto notebook server.  
Once you open the Pluto notebook, it will begin executing the entire notebook.  (Depending on your system and how complex the notebook is, sometimes this can take a little time.)  You'll read through this notebook, make some small changes, see how that affects the results, save your changes to your local machine, commit your changes to your local git repository, and then push those to your repository on github.
For many of you, this is likely your first time using all of these tools, and it probably sounds like a lot.  The good news is that before long all of this will become second nature and you'll wonder how you got along without such tools. 
"""

# ╔═╡ c15ce452-494f-407c-9c08-02d547929e6a
md"""
## Assigning Variables
In Julia, you assign variables values using the `=` sign.
Assigning integer or floating point numbers uses a natural notation.
Once a cell is executed, Pluto shows the output of each cell above the cell with the relevant code.
For example,"""

# ╔═╡ 25d5497c-3a67-4495-9f37-0bc8f2a64e68
current_year = 2025

# ╔═╡ 774b2e4a-6cd7-4c9a-920d-b4f38354d42d
md"""Strings are created by enclosing text between double quotes.  
For example,"""

# ╔═╡ 5917df75-0dab-4778-917e-91bbfddbe03a
begin
	course_number = "Astro 528"
	semester = "Fall 2025"
	instructor = "Eric Ford"
end

# ╔═╡ 0d15ba33-f2c4-46d6-9b08-9181d40596cd
md"""Notice that, when working in a Pluto notebook, cells that assign multiple variables need to be wraped in a `begin...end` block.  (This is not necessary in general (e.g., julia scripts, Jupyter notebooks, or module code.)  
Note that only the output from the last line is displayed.  The other variables were still assigned and can be accessed in other cells."""

# ╔═╡ dc0bf251-b3a6-42f7-84f6-796ac3761b2d
course_number

# ╔═╡ dbfceab2-994d-45a1-97ff-d978827bd129
tip(md"""Single quotes are used to indicate a single character (as opposed to a string of length 1).  
[Triple quoted string literals](https://docs.julialang.org/en/v1/manual/strings/#Triple-Quoted-String-Literals) are useful for quotes spanning multiple lines (and when you want to include `"` symbols). 
""")

# ╔═╡ e2bb48e5-a2b2-42d7-a8e5-5c7532d62e93
md"Assigning integer or floating point numbers uses a natural notation."

# ╔═╡ cda49166-b9fb-4e68-8b3e-b97845c7bf3b
instructor_year = current_year - 1999

# ╔═╡ 0c5d5b14-6c9a-4ac9-8126-0d6e1edba593
favorite_number = 3.1415926535897

# ╔═╡ a3450384-ccfc-4bda-af52-24ed8f429cf8
md"""Now, it's your turn to create variables named `student_name`, `student dept` and `student_year` with values based on yourself.  You can modify the code in the cells below."""

# ╔═╡ 33350a21-7971-406e-b316-6539eca72bf4
begin  # INSERT YOUR RESPONSES BELOW
	student_name = missing
	student_dept = missing
	student_year = missing
end;

# ╔═╡ f15643a4-39d5-4492-98d3-9db4f4cb0d3b
md"""
Run the cell with your code and make sure there are no error messages.  
Sometimes, I may provide a few quick checks in the Pluto notebook itself.  For example,
"""

# ╔═╡ 1bc2edaf-a0a7-4c4e-96c2-25872dd30e2e
if !@isdefined(student_year)
	not_defined(:student_year)
else
	let
		if ismissing(student_name)
			still_missing()
		elseif isnothing(student_name)
			keep_working("Could there be a typeo?")
		elseif !(student_name isa String) 
			keep_working(md"The value should be a String.")
		else
			correct(md"You set `student_name` to $student_name.")
		end
	end
end

# ╔═╡ c05d62b5-6063-41ca-9823-2499b2d4fbc4
if !@isdefined(student_dept)
	not_defined(:student_dept)
else
	let
		if ismissing(student_dept)
			still_missing()
		elseif isnothing(student_dept)
			keep_working("Could there be a typeo?")
		elseif !(student_dept isa String) 
			keep_working(md"The value of `student_year` should be a String.")
		elseif occursin("Astro", student_dept)
			correct(md"Welcome back.")
		else
			correct(md"We're glad to have you join us.")
		end
	end
end

# ╔═╡ 8b666639-e3d0-4535-803d-40ddc4360a9c
if !@isdefined(student_year)
	not_defined(:student_year)
else
	let
		if ismissing(student_year)
			still_missing()
		elseif isnothing(student_year)
			keep_working("Could there be a typeo?")
		elseif !(student_year isa Integer) 
			keep_working(md"The value should be an integer.")
		elseif ! (1<= student_year)
			keep_working(md"I'm expecting `student_year` to be one or larger.")
		elseif ! (student_year <= 10)
			keep_working(md"Are you sure?  Most grad students finish in less than 10 years.")
		else
			correct(md"I think that $student_year seems like a reasonable value for `student_year`.")
		end
	end
end

# ╔═╡ ec4ec6e7-9548-4bd6-970a-48fefa9861d7
md"""
## Pass a Test
Once we start doing real calculations, it will be important to test our work.  Therefore, you and I will both write tests that your code should pass. For example, in this case we can test that variables with the correct names exist, they're not empty, that they have the expected type, that their value falls within a reasonable range, etc.
"""

# ╔═╡ ac9e6787-5c42-44d6-907e-e7033e7ab4bc
tip(md"Before using a test, we need to tell Julia to import a module that will provide the `@test` macro.  To simplify the notebook, I've put that code at the bottom of the notebook, so it doesn't distract from our main task.")

# ╔═╡ 087b40c4-7d59-4f9a-b584-65c2aa9f9578
md"
The first few tests below should pass.  Later, I've written a couple of tests with bugs in them for you to fix.  Look at the results of the cells below, find the tests that doesn't pass, and modify the code so that it passes.  
"

# ╔═╡ eefa92a1-1d4c-4536-abd3-1c1af98e146f
md"One of the first things to check is that variables have been defined.  If not, then later tests will fail and we might spend time trying to dive deeper into the problem than we need to."

# ╔═╡ 78f81544-fead-4649-b306-48fb1463d397
@test @isdefined(student_name)

# ╔═╡ 3d224633-0eb8-407c-b44c-0d9ec927dfc6
@test @isdefined(student_dept)

# ╔═╡ 2fe3f4e8-5288-4f61-9346-7a455c2abc85
@test @isdefined(student_year)

# ╔═╡ b49789b2-49c0-49e3-b81f-db04e60f9d23
md"Next, we'll test that the types of the variables are what we expect.  If not, then it's unlikely that the values stored will be what we expect."

# ╔═╡ 34f767c9-f95f-4968-9423-ad87bb456775
@test typeof(student_name) == String

# ╔═╡ d6417bdc-9e36-4d2b-8b3e-f5ddafd82437
@test typeof(student_dept) == String

# ╔═╡ 89ac58ea-b782-4dcc-802f-d6d063e7b855
@test typeof(student_year) <: Number

# ╔═╡ 2479fb6a-2e51-4e6f-8155-d47e9e3ae27d
@test typeof(student_year) <: Integer

# ╔═╡ 6d8e0985-3613-49bc-8050-91e2ee73de52
md"We often see the `==` operator when testing for equality of two numbers.  Here the `==` operator is testing for the equivalence of two types.
Alternatively, we can use the `<:` operator to ask if one type is a 'sub-type' of another 'abstract type'."

# ╔═╡ 7f031249-4413-4cd6-8ba5-b3369a1216a0
md"Now, we're ready to test that the values of the variables are consistent with what we expect."  

# ╔═╡ 8ff88c72-7982-4025-9057-384a48186dc9
@test !ismissing(student_name) && length(student_name) > 3

# ╔═╡ c408ddb6-af5d-4b6a-ae81-9d338fd15f06
@test !ismissing(student_name) && occursin(' ',student_name)

# ╔═╡ 939a5680-c387-454d-a7f0-16e0d51254d8
md"In the above cell, we test that the `occursin` function retures true.  There should be a slider widget.  Try dragging it left or right.  This can be helpful when figuring out *why* a complicated test fails."

# ╔═╡ d732ab18-65b3-417a-8f8d-5f4502baa777
@test !ismissing(student_dept) && length(student_dept) >= 3

# ╔═╡ bc491991-1c10-43bb-8afe-3ed08c91d3d7
@test !ismissing(student_year) && 1 <= student_year <= 10

# ╔═╡ a328c8c6-6268-4b1f-ae1c-84ee295285c8
@test student_name == instructor

# ╔═╡ 852d7d9d-fc12-42f2-863f-af0b647979df
md"**TODO:** There are (at least) two bugs in the above tests.  Find them and fix them."

# ╔═╡ 6584e095-465d-4b3d-a383-9ac569e307cc
md"In the future, we'll separate out the tests for each exercise into a separate file (located in the `test` directory of the lab repository), so that they don't distract from the code we're writing."

# ╔═╡ 68341392-aa5a-41b7-a76a-76db1c6357f5
md"""Once you're happy with the results, it's time to save your notebook.  Look for the button in the upper right or `Ctrl`+'S'.  If it's not there, then your notebook has been autosaved.  

Then read the [instructions for submitting assignments](https://psuastro528.github.io/tips/submitting) for how to commit your changes to your local git repository and push them to github. 
    
When you're done you can look into the second notebook (ex2) in this repository to begin the next exercise."""

# ╔═╡ 51a1bf7c-6a1d-4d31-a735-de3414a97ab6
md"""## Helper code"""

# ╔═╡ 4d860e75-0631-4ef6-853c-818bafe080f4
md"""Students can ignore the code below was quietly used above."""

# ╔═╡ b9f89dc4-a8e8-4afe-9da6-9880cfcf2a37
md"""
The above cell both loads the code from packages and brings the functions (and macros) that it "exports" "into scope", meaing that we can "just call them" without having to include the package name as a prefix. 
"""

# ╔═╡ 45efd82d-63e1-4016-838e-d0fbb21db99f
md"The PlutoUI package provides several cool features, but for now we just use it to add the Table of Contents in the upper right corent."

# ╔═╡ 60348e2d-9943-486c-9061-3c5c3bf88883
md"The PlutoTest package provides an alternative `@test` macro for use in Pluto notebooks."

# ╔═╡ 98ecc733-15f3-4263-821a-483dadfc8ab8
Foldable("Pro Tip!",tip(md"Normally, we'd use the `Test` module for the `@test` macro.  Julia has a large set of modules and packages, that range from very basic functionality to complex science codes.  The quality also varries widely.  Several modules (like `Test`) are included in Julia standard library, so they're already installed for us.  
	
However, inside Pluto, it can be helpful to instead import `PlutoTest`, since it displays the results particularly nicely.  (It's an external package and it's still experimental, so if things break in the future, then we can revert to just using `Test`."))

# ╔═╡ ceff74da-4cd2-4091-af1a-8ecde8e13700
md"The PlutoTeachingTools package has several small functions that we use for things like tips."

# ╔═╡ 73a3ce7e-9967-4d11-8ab7-0e0409190975
TableOfContents()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoTest = "cb4044da-4d16-4ffa-a6a3-8cad7f73ebdc"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.2"
manifest_format = "2.0"
project_hash = "ca6f24c1202285b277bc58794a6bb4a2885a5ffb"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "67e11ee83a43eb71ddc950302c53bf33f0690dfe"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.12.1"

    [deps.ColorTypes.extensions]
    StyledStringsExt = "StyledStrings"

    [deps.ColorTypes.weakdeps]
    StyledStrings = "f489334b-da3d-4c2e-b8f0-e476e12c162b"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Format]]
git-tree-sha1 = "9c68794ef81b08086aeb32eeaf33531668d5f5fc"
uuid = "1fa38f19-a742-5d3f-a2b9-30dd87b9d5f8"
version = "1.3.7"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "b6d6bfdd7ce25b0f9b2f6b3dd56b2673a66c8770"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.5"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.LaTeXStrings]]
git-tree-sha1 = "dda21b8cbd6a6c40d9d02a73230f9d70fed6918c"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.4.0"

[[deps.Latexify]]
deps = ["Format", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Requires"]
git-tree-sha1 = "52e1296ebbde0db845b356abbbe67fb82a0a116c"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.9"

    [deps.Latexify.extensions]
    DataFramesExt = "DataFrames"
    SparseArraysExt = "SparseArrays"
    SymEngineExt = "SymEngine"
    TectonicExt = "tectonic_jll"

    [deps.Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"
    tectonic_jll = "d7dd28d6-a5e6-559c-9131-7eb760cdacc5"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.6.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.7.2+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.MIMEs]]
git-tree-sha1 = "c64d943587f7187e751162b3b84445bbbd79f691"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "1.1.0"

[[deps.MacroTools]]
git-tree-sha1 = "1e0228a030642014fe5cfe68c2c0a818f9e3f522"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.16"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.6+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.12.12"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.OrderedCollections]]
git-tree-sha1 = "05868e21324cede2207c6f0f466b4bfef6d5e7ee"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.8.1"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "7d2f8f21da5db6a806faf7b9b292296da42b2810"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.3"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.11.0"

    [deps.Pkg.extensions]
    REPLExt = "REPL"

    [deps.Pkg.weakdeps]
    REPL = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.PlutoTeachingTools]]
deps = ["Downloads", "HypertextLiteral", "Latexify", "Markdown", "PlutoUI"]
git-tree-sha1 = "85778cdf2bed372008e6646c64340460764a5b85"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.4.5"

[[deps.PlutoTest]]
deps = ["HypertextLiteral", "InteractiveUtils", "Markdown", "Test"]
git-tree-sha1 = "17aa9b81106e661cffa1c4c36c17ee1c50a86eda"
uuid = "cb4044da-4d16-4ffa-a6a3-8cad7f73ebdc"
version = "0.2.2"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Downloads", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "fcfec547342405c7a8529ea896f98c0ffcc4931d"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.70"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "0f27480397253da18fe2c12a4ba4eb9eb208bf3d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.5.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "62389eeff14780bfe55195b7204c0d8738436d64"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.1"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

    [deps.Statistics.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.Tricks]]
git-tree-sha1 = "372b90fe551c019541fafc6ff034199dc19c8436"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.12"

[[deps.URIs]]
git-tree-sha1 = "bef26fb046d031353ef97a82e3fdb6afe7f21b1a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.6.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.59.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"
"""

# ╔═╡ Cell order:
# ╟─5b826e17-ad51-43d0-9756-89a9fd0ea834
# ╟─acb10cb1-d03d-47c5-90dc-7216e5110ed2
# ╟─c15ce452-494f-407c-9c08-02d547929e6a
# ╠═25d5497c-3a67-4495-9f37-0bc8f2a64e68
# ╟─774b2e4a-6cd7-4c9a-920d-b4f38354d42d
# ╠═5917df75-0dab-4778-917e-91bbfddbe03a
# ╟─0d15ba33-f2c4-46d6-9b08-9181d40596cd
# ╠═dc0bf251-b3a6-42f7-84f6-796ac3761b2d
# ╟─dbfceab2-994d-45a1-97ff-d978827bd129
# ╟─e2bb48e5-a2b2-42d7-a8e5-5c7532d62e93
# ╠═cda49166-b9fb-4e68-8b3e-b97845c7bf3b
# ╠═0c5d5b14-6c9a-4ac9-8126-0d6e1edba593
# ╟─a3450384-ccfc-4bda-af52-24ed8f429cf8
# ╠═33350a21-7971-406e-b316-6539eca72bf4
# ╟─f15643a4-39d5-4492-98d3-9db4f4cb0d3b
# ╟─1bc2edaf-a0a7-4c4e-96c2-25872dd30e2e
# ╟─c05d62b5-6063-41ca-9823-2499b2d4fbc4
# ╟─8b666639-e3d0-4535-803d-40ddc4360a9c
# ╟─ec4ec6e7-9548-4bd6-970a-48fefa9861d7
# ╟─ac9e6787-5c42-44d6-907e-e7033e7ab4bc
# ╟─087b40c4-7d59-4f9a-b584-65c2aa9f9578
# ╟─eefa92a1-1d4c-4536-abd3-1c1af98e146f
# ╠═78f81544-fead-4649-b306-48fb1463d397
# ╠═3d224633-0eb8-407c-b44c-0d9ec927dfc6
# ╠═2fe3f4e8-5288-4f61-9346-7a455c2abc85
# ╟─b49789b2-49c0-49e3-b81f-db04e60f9d23
# ╠═34f767c9-f95f-4968-9423-ad87bb456775
# ╠═d6417bdc-9e36-4d2b-8b3e-f5ddafd82437
# ╠═89ac58ea-b782-4dcc-802f-d6d063e7b855
# ╠═2479fb6a-2e51-4e6f-8155-d47e9e3ae27d
# ╟─6d8e0985-3613-49bc-8050-91e2ee73de52
# ╟─7f031249-4413-4cd6-8ba5-b3369a1216a0
# ╠═8ff88c72-7982-4025-9057-384a48186dc9
# ╠═c408ddb6-af5d-4b6a-ae81-9d338fd15f06
# ╟─939a5680-c387-454d-a7f0-16e0d51254d8
# ╠═d732ab18-65b3-417a-8f8d-5f4502baa777
# ╠═bc491991-1c10-43bb-8afe-3ed08c91d3d7
# ╠═a328c8c6-6268-4b1f-ae1c-84ee295285c8
# ╟─852d7d9d-fc12-42f2-863f-af0b647979df
# ╟─6584e095-465d-4b3d-a383-9ac569e307cc
# ╟─68341392-aa5a-41b7-a76a-76db1c6357f5
# ╟─51a1bf7c-6a1d-4d31-a735-de3414a97ab6
# ╟─4d860e75-0631-4ef6-853c-818bafe080f4
# ╠═ab976d70-f59d-4dcd-ac89-771606a74108
# ╟─b9f89dc4-a8e8-4afe-9da6-9880cfcf2a37
# ╟─45efd82d-63e1-4016-838e-d0fbb21db99f
# ╟─60348e2d-9943-486c-9061-3c5c3bf88883
# ╟─98ecc733-15f3-4263-821a-483dadfc8ab8
# ╟─ceff74da-4cd2-4091-af1a-8ecde8e13700
# ╟─73a3ce7e-9967-4d11-8ab7-0e0409190975
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
