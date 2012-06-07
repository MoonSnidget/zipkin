#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#


module Zipkin
    module AnnotationType
      BOOL = 0
      BYTES = 1
      I16 = 2
      I32 = 3
      I64 = 4
      DOUBLE = 5
      STRING = 6
      VALUE_MAP = {0 => "BOOL", 1 => "BYTES", 2 => "I16", 3 => "I32", 4 => "I64", 5 => "DOUBLE", 6 => "STRING"}
      VALID_VALUES = Set.new([BOOL, BYTES, I16, I32, I64, DOUBLE, STRING]).freeze
    end

    module Order
      TIMESTAMP_DESC = 0
      TIMESTAMP_ASC = 1
      DURATION_ASC = 2
      DURATION_DESC = 3
      NONE = 4
      VALUE_MAP = {0 => "TIMESTAMP_DESC", 1 => "TIMESTAMP_ASC", 2 => "DURATION_ASC", 3 => "DURATION_DESC", 4 => "NONE"}
      VALID_VALUES = Set.new([TIMESTAMP_DESC, TIMESTAMP_ASC, DURATION_ASC, DURATION_DESC, NONE]).freeze
    end

    module Adjust
      NOTHING = 0
      TIME_SKEW = 1
      VALUE_MAP = {0 => "NOTHING", 1 => "TIME_SKEW"}
      VALID_VALUES = Set.new([NOTHING, TIME_SKEW]).freeze
    end

    module ResultCode
      OK = 0
      TRY_LATER = 1
      VALUE_MAP = {0 => "OK", 1 => "TRY_LATER"}
      VALID_VALUES = Set.new([OK, TRY_LATER]).freeze
    end

    class Endpoint
      include ::Thrift::Struct, ::Thrift::Struct_Union
      IPV4 = 1
      PORT = 2
      SERVICE_NAME = 3

      FIELDS = {
        IPV4 => {:type => ::Thrift::Types::I32, :name => 'ipv4'},
        PORT => {:type => ::Thrift::Types::I16, :name => 'port'},
        SERVICE_NAME => {:type => ::Thrift::Types::STRING, :name => 'service_name'}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Annotation
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TIMESTAMP = 1
      VALUE = 2
      HOST = 3

      FIELDS = {
        TIMESTAMP => {:type => ::Thrift::Types::I64, :name => 'timestamp'},
        VALUE => {:type => ::Thrift::Types::STRING, :name => 'value'},
        HOST => {:type => ::Thrift::Types::STRUCT, :name => 'host', :class => Zipkin::Endpoint, :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class BinaryAnnotation
      include ::Thrift::Struct, ::Thrift::Struct_Union
      KEY = 1
      VALUE = 2
      ANNOTATION_TYPE = 3
      HOST = 4

      FIELDS = {
        KEY => {:type => ::Thrift::Types::STRING, :name => 'key'},
        VALUE => {:type => ::Thrift::Types::STRING, :name => 'value', :binary => true},
        ANNOTATION_TYPE => {:type => ::Thrift::Types::I32, :name => 'annotation_type', :enum_class => Zipkin::AnnotationType},
        HOST => {:type => ::Thrift::Types::STRUCT, :name => 'host', :class => Zipkin::Endpoint, :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
        unless @annotation_type.nil? || Zipkin::AnnotationType::VALID_VALUES.include?(@annotation_type)
          raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field annotation_type!')
        end
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Span
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TRACE_ID = 1
      NAME = 3
      ID = 4
      PARENT_ID = 5
      ANNOTATIONS = 6
      BINARY_ANNOTATIONS = 8

      FIELDS = {
        TRACE_ID => {:type => ::Thrift::Types::I64, :name => 'trace_id'},
        NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
        ID => {:type => ::Thrift::Types::I64, :name => 'id'},
        PARENT_ID => {:type => ::Thrift::Types::I64, :name => 'parent_id', :optional => true},
        ANNOTATIONS => {:type => ::Thrift::Types::LIST, :name => 'annotations', :element => {:type => ::Thrift::Types::STRUCT, :class => Zipkin::Annotation}},
        BINARY_ANNOTATIONS => {:type => ::Thrift::Types::LIST, :name => 'binary_annotations', :element => {:type => ::Thrift::Types::STRUCT, :class => Zipkin::BinaryAnnotation}}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class Trace
      include ::Thrift::Struct, ::Thrift::Struct_Union
      SPANS = 1

      FIELDS = {
        SPANS => {:type => ::Thrift::Types::LIST, :name => 'spans', :element => {:type => ::Thrift::Types::STRUCT, :class => Zipkin::Span}}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class QueryException < ::Thrift::Exception
      include ::Thrift::Struct, ::Thrift::Struct_Union
      def initialize(message=nil)
        super()
        self.msg = message
      end

      def message; msg end

      MSG = 1

      FIELDS = {
        MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class AdjustableRateException < ::Thrift::Exception
      include ::Thrift::Struct, ::Thrift::Struct_Union
      def initialize(message=nil)
        super()
        self.msg = message
      end

      def message; msg end

      MSG = 1

      FIELDS = {
        MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    # This sums up a single Trace to make it easy for a client to get an overview of what happened.
    class TraceSummary
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TRACE_ID = 1
      START_TIMESTAMP = 2
      END_TIMESTAMP = 3
      DURATION_MICRO = 4
      SERVICE_COUNTS = 5
      ENDPOINTS = 6

      FIELDS = {
        TRACE_ID => {:type => ::Thrift::Types::I64, :name => 'trace_id'},
        START_TIMESTAMP => {:type => ::Thrift::Types::I64, :name => 'start_timestamp'},
        END_TIMESTAMP => {:type => ::Thrift::Types::I64, :name => 'end_timestamp'},
        DURATION_MICRO => {:type => ::Thrift::Types::I32, :name => 'duration_micro'},
        SERVICE_COUNTS => {:type => ::Thrift::Types::MAP, :name => 'service_counts', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::I32}},
        ENDPOINTS => {:type => ::Thrift::Types::LIST, :name => 'endpoints', :element => {:type => ::Thrift::Types::STRUCT, :class => Zipkin::Endpoint}}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    # A modified version of the Annotation struct that brings in more information
    class TimelineAnnotation
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TIMESTAMP = 1
      VALUE = 2
      HOST = 3
      SPAN_ID = 4
      PARENT_ID = 5
      SERVICE_NAME = 6
      SPAN_NAME = 7

      FIELDS = {
        TIMESTAMP => {:type => ::Thrift::Types::I64, :name => 'timestamp'},
        VALUE => {:type => ::Thrift::Types::STRING, :name => 'value'},
        HOST => {:type => ::Thrift::Types::STRUCT, :name => 'host', :class => Zipkin::Endpoint},
        SPAN_ID => {:type => ::Thrift::Types::I64, :name => 'span_id'},
        PARENT_ID => {:type => ::Thrift::Types::I64, :name => 'parent_id', :optional => true},
        SERVICE_NAME => {:type => ::Thrift::Types::STRING, :name => 'service_name'},
        SPAN_NAME => {:type => ::Thrift::Types::STRING, :name => 'span_name'}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    # This sums up a single Trace to make it easy for a client to get an overview of what happened.
    class TraceTimeline
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TRACE_ID = 1
      ROOT_MOST_SPAN_ID = 2
      ANNOTATIONS = 6
      BINARY_ANNOTATIONS = 7

      FIELDS = {
        TRACE_ID => {:type => ::Thrift::Types::I64, :name => 'trace_id'},
        ROOT_MOST_SPAN_ID => {:type => ::Thrift::Types::I64, :name => 'root_most_span_id'},
        ANNOTATIONS => {:type => ::Thrift::Types::LIST, :name => 'annotations', :element => {:type => ::Thrift::Types::STRUCT, :class => Zipkin::TimelineAnnotation}},
        BINARY_ANNOTATIONS => {:type => ::Thrift::Types::LIST, :name => 'binary_annotations', :element => {:type => ::Thrift::Types::STRUCT, :class => Zipkin::BinaryAnnotation}}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    # Returns a combination of trace, summary and timeline.
    class TraceCombo
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TRACE = 1
      SUMMARY = 2
      TIMELINE = 3
      SPAN_DEPTHS = 4

      FIELDS = {
        TRACE => {:type => ::Thrift::Types::STRUCT, :name => 'trace', :class => Zipkin::Trace},
        SUMMARY => {:type => ::Thrift::Types::STRUCT, :name => 'summary', :class => Zipkin::TraceSummary, :optional => true},
        TIMELINE => {:type => ::Thrift::Types::STRUCT, :name => 'timeline', :class => Zipkin::TraceTimeline, :optional => true},
        SPAN_DEPTHS => {:type => ::Thrift::Types::MAP, :name => 'span_depths', :key => {:type => ::Thrift::Types::I64}, :value => {:type => ::Thrift::Types::I32}, :optional => true}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class LogEntry
      include ::Thrift::Struct, ::Thrift::Struct_Union
      CATEGORY = 1
      MESSAGE = 2

      FIELDS = {
        CATEGORY => {:type => ::Thrift::Types::STRING, :name => 'category'},
        MESSAGE => {:type => ::Thrift::Types::STRING, :name => 'message'}
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

  end