function shark.split
  set -l ln first
  set -l lt ""
  for char in (echo $argv | grep -o .)
    switch $char
      # Negative numbers. Reset hyphen if followed by another.
      case -
        test -z $lt
          and set lt -
          or set lt  ""
      # Read numbers, split by \n if a ln has been collected.
      case 0 1 2 3 4 5 6 7 8 9 .
        test -n $ln -a $ln != first
          and printf $ln
        test -z $lt
          or printf $lt
        printf $char
        set ln ""
      # Reduce everything else to a \n, skip first character.
      case \*
        # Hyphens not inmediately prepended to numbers are just hyphens.
        set lt ""
        test -z $ln -a $ln != first
          and set ln \n
    end
  end
end
