$patterns = {
  "..." => ".",
  "..*" => "*",
  ".*." => "*",
  ".**" => "*",
  "*.." => ".",
  "*.*" => "*",
  "**." => "*",
  "***" => ".",
}

rule_len = 30

init_line = ""
for i in 0..(rule_len-1)
  i != rule_len-1 ? init_line << "." : init_line << "*"
end
             

def rule110(prev_line, max_depth=20, depth=0)
  puts prev_line if depth == 0
  return if depth >= max_depth
  new_line = prev_line
  for i in 0..(prev_line.length-1)
    cur_pat = "#{prev_line[i-1]}#{prev_line[i]}#{prev_line[i+1]}"
    if $patterns.include? cur_pat
      new_line = new_line[0, i] + $patterns[cur_pat] + new_line[i+1..-1]
    end
  end
  puts new_line
  rule110(new_line, max_depth, depth+1)
end

rule110(init_line, max_depth=30)
