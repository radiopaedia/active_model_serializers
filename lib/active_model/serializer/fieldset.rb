module ActiveModel
  class Serializer
    class Fieldset
      def initialize(fields)
        @raw_fields = fields
      end

      def fields
        @fields ||= parsed_fields
      end

      def fields_for(type)
        fields[type.singularize.to_sym] || fields[type.pluralize.to_sym]
      end

      protected

      attr_reader :raw_fields

      private

      def parsed_fields
        if raw_fields.is_a?(Hash)
          raw_fields.inject({}) { |h, (k, v)| h[k.to_sym] = v.map(&:to_sym); h }
        else
          {}
        end
      end
    end
  end
end
