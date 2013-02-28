Fabricator(:entry) do
  title { Faker::Company.bs }
  content <<-CONTENT
This blog post contains some simple HTML markup and some code.
        
> Something happened.
> We don't know why.
> <cite>Einstein</cite>
        
``` haskell
import Distribution.Simple
        
main = defaultMain
        
foo :: IO ()
foo a = do
    b <- return "hello"
    putStrLn a
    putStrLn b
```
  CONTENT
  entry_type 'blog'
  published true
  tag_list { Faker::Lorem.words(6).join(" ") }
end