/*
 * Copyright 2007-2011 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springextensions.actionscript.rpc {
	import flash.errors.IllegalOperationError;
	
	import org.springextensions.actionscript.core.operation.IOperation;

	/**
	 * Abstract base class for RPC services 
	 * @author Roland Zwaga
	 */
	public class AbstractRPCService implements IService {
		
		public function AbstractRPCService() {
			super();
		}

		public function call(methodName:String, ... parameters):IOperation {
			throw new IllegalOperationError("Not implemented in base class");
		}
	}
}