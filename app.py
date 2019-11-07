
from pyspark import SparkContext
from pyspark.streaming import StreamingContext


sc = SparkContext('local[2]', 'teste')
ssc = StreamingContext(sc, 2)

lines = ssc.socketTextStream('localhost', 3333)

ssc.start()
ssc.awaitTermination()