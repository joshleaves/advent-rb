require 'json'

class Year2015
  class Day12
    def cleanup_array(node)
      return node if node.none?{|subnode| subnode.is_a?(Hash) || subnode.is_a?(Array) }

      node.map do |subnode|
        next cleanup_array(subnode) if subnode.is_a?(Array)
        next cleanup_hash(subnode) if subnode.is_a?(Hash)

        subnode
      end
    end

    def cleanup_hash(node)
      return {} if node.any?{|_k, subnode| subnode == 'red' }

      node.transform_values do |subnode|
        next cleanup_array(subnode) if subnode.is_a?(Array)
        next cleanup_hash(subnode) if subnode.is_a?(Hash)

        subnode
      end
    end

    def cleanup_input
      input_json = JSON.parse(@input_file)

      input_json = input_json.is_a?(Array) ? cleanup_array(input_json) : cleanup_hash(input_json)
      @input_file = input_json.to_s
    end

    def initialize(input_data, input_part_one = false)
      @input_file = input_data
      cleanup_input unless input_part_one
    end

    def to_i
      @to_i ||= @input_file.scan(/-?\d+/).sum(&:to_i) || 0
    end

    def to_s
      @input_file
    end
  end
end
