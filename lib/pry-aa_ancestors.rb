require "pry"

# String
class String
  # surround string.
  #
  # ==== Options
  #
  # * <tt>:top_bottom</tt> - set top and bottom charactor
  # * <tt>:side</tt> - set right and left charactor
  #
  # ==== Examples
  #
  # single line, no option case
  #
  #   'hoge'.surround
  #
  # result
  #
  #   ------
  #   |hoge|
  #   ------
  #
  # multi line, no option case
  #
  #   "hoge\na".surround
  #
  # result
  #
  #   ------
  #   |hoge|
  #   |a   |
  #   ------
  #
  # single line, both option case
  #
  #   'hoge'.surround top_bottom: '=', side: '!'
  #
  # result
  #
  #   ======
  #   !hoge!
  #   ======
  #
  def surround(options = { top_bottom: '-', side: '|' })
    top_bottom = init_top_bottom(options)
    side = init_side(options)
    inner_width = line_max
    top_bottom = top_bottoms(top_bottom, inner_width)
    ret = *each_line.reduce([top_bottom]) do |a, e|
      a << "#{side}#{e.chomp.ljust(inner_width)}#{side}"
    end
    ret.push(top_bottom).join("\n")
  end

  private

  def init_top_bottom(options)
    options[:top_bottom].nil? ? '-' : options[:top_bottom]
  end

  def init_side(options)
    options[:side].nil? ? '|' : options[:side]
  end

  def top_bottoms(top_bottom, inner_width)
    top_bottom * (inner_width + 2)
  end

  def line_max
    return 0 if self.empty?
    each_line.max_by(&:size).chomp.size
  end
end

# Kernel
module Kernel
  # Ascii Art Ancestors
  #
  # === Examples
  #
  # define class
  #
  #   class BaseHogeForAncestors;end
  #   class HogeForAncestors < BaseHogeForAncestors;end
  #
  # execute aa_ancestors
  #
  #   puts HogeForAncestors.aa_ancestors
  #
  # result is ...
  #
  #   ----------------------
  #   |     BasicObject    |
  #   ----------------------
  #             |
  #   ----------------------
  #   |       Kernel       |
  #   ----------------------
  #             |
  #   ----------------------
  #   |       Object       |
  #   ----------------------
  #             |
  #   ----------------------
  #   |BaseHogeForAncestors|
  #   ----------------------
  #             |
  #   ----------------------
  #   |  HogeForAncestors  |
  #   ----------------------
  def aa_ancestors
    max_class = max_size_class
    max = max_class.to_s.size
    ca = centered_ancestors(max)
    ba = surrounded_ancestors(ca)
    connected_box_ancestors(ba, max)
  end

  private

  def max_size_class
    ancestors.max_by { |v|v.to_s.size }
  end

  def centered_ancestors(max)
    ancestors.reverse.map { |v|v.to_s.center max }
  end

  def surrounded_ancestors(ca)
    ca.reduce([]) { |a, e|a << e.surround }
  end

  def connected_box_ancestors(ba, max)
    ba.join(ancestors_connector(max))
  end

  def ancestors_connector(max)
    connector = '|'.rjust((max + 2) / 2)
    "\n#{connector}\n"
  end
end

Pry::Commands.create_command 'aa_ancestors' do
  description 'Show the class hierarchy that is Ascii-Art format.'

  def process(klass)
    target = eval klass, binding
    output.puts(target.aa_ancestors)
  end
end
